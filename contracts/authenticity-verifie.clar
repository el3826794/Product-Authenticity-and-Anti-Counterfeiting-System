;; Authenticity Verifier Contract
;; Provides product authenticity verification services

;; Constants
(define-constant ERR-PRODUCT-NOT-FOUND (err u300))
(define-constant ERR-INVALID-INPUT (err u301))
(define-constant ERR-VERIFICATION-FAILED (err u302))

;; Data Variables
(define-data-var next-verification-id uint u1)

;; Data Maps
(define-map verification-requests
  { verification-id: uint }
  {
    product-code: (string-ascii 50),
    requester: principal,
    request-date: uint,
    verification-result: bool,
    verification-date: (optional uint),
    verification-details: (string-ascii 200)
  }
)

(define-map product-verification-count
  { product-code: (string-ascii 50) }
  { count: uint, last-verified: uint }
)

(define-map verification-by-product
  { product-code: (string-ascii 50), verification-id: uint }
  { verified: bool }
)

;; Public Functions

;; Verify product authenticity
(define-public (verify-authenticity (product-code (string-ascii 50)))
  (let
    (
      (verification-id (var-get next-verification-id))
      (current-block-height block-height)
    )
    ;; Validate input
    (asserts! (> (len product-code) u0) ERR-INVALID-INPUT)

    ;; Check if product exists (simplified check - in real implementation would call product-registry)
    (asserts! (> (len product-code) u5) ERR-PRODUCT-NOT-FOUND)

    ;; Create verification request
    (map-set verification-requests
      { verification-id: verification-id }
      {
        product-code: product-code,
        requester: tx-sender,
        request-date: current-block-height,
        verification-result: true,
        verification-date: (some current-block-height),
        verification-details: "Product verified as authentic"
      }
    )

    ;; Update verification count
    (let
      (
        (current-count (default-to u0 (get count (map-get? product-verification-count { product-code: product-code }))))
      )
      (map-set product-verification-count
        { product-code: product-code }
        { count: (+ current-count u1), last-verified: current-block-height }
      )
    )

    ;; Create product verification mapping
    (map-set verification-by-product
      { product-code: product-code, verification-id: verification-id }
      { verified: true }
    )

    ;; Increment verification ID
    (var-set next-verification-id (+ verification-id u1))

    (ok { verification-id: verification-id, authentic: true })
  )
)

;; Report counterfeit product
(define-public (report-counterfeit
  (product-code (string-ascii 50))
  (report-details (string-ascii 200)))
  (let
    (
      (verification-id (var-get next-verification-id))
      (current-block-height block-height)
    )
    ;; Validate input
    (asserts! (> (len product-code) u0) ERR-INVALID-INPUT)
    (asserts! (> (len report-details) u0) ERR-INVALID-INPUT)

    ;; Create counterfeit report
    (map-set verification-requests
      { verification-id: verification-id }
      {
        product-code: product-code,
        requester: tx-sender,
        request-date: current-block-height,
        verification-result: false,
        verification-date: (some current-block-height),
        verification-details: report-details
      }
    )

    ;; Create product verification mapping
    (map-set verification-by-product
      { product-code: product-code, verification-id: verification-id }
      { verified: false }
    )

    ;; Increment verification ID
    (var-set next-verification-id (+ verification-id u1))

    (ok verification-id)
  )
)

;; Batch verify multiple products
(define-public (batch-verify (product-codes (list 10 (string-ascii 50))))
  (let
    (
      (verification-results (map verify-single-product product-codes))
    )
    (ok verification-results)
  )
)

;; Read-only Functions

;; Get verification information
(define-read-only (get-verification-info (verification-id uint))
  (map-get? verification-requests { verification-id: verification-id })
)

;; Get product verification count
(define-read-only (get-verification-count (product-code (string-ascii 50)))
  (default-to u0 (get count (map-get? product-verification-count { product-code: product-code })))
)

;; Get last verification date
(define-read-only (get-last-verification-date (product-code (string-ascii 50)))
  (default-to u0 (get last-verified (map-get? product-verification-count { product-code: product-code })))
)

;; Check if product has been verified
(define-read-only (is-product-verified (product-code (string-ascii 50)))
  (> (get-verification-count product-code) u0)
)

;; Get verification history for product
(define-read-only (get-product-verification-history (product-code (string-ascii 50)) (verification-id uint))
  (map-get? verification-by-product { product-code: product-code, verification-id: verification-id })
)

;; Get total verifications
(define-read-only (get-total-verifications)
  (- (var-get next-verification-id) u1)
)

;; Private Functions

;; Helper function for batch verification
(define-private (verify-single-product (product-code (string-ascii 50)))
  {
    product-code: product-code,
    authentic: (> (len product-code) u5),
    verification-count: (get-verification-count product-code)
  }
)
