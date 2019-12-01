#lang racket

; Solution for AOC Day 1 challenge 1
(define (fuel-for-mass mass)
  (- (floor (/ mass 3)) 2)
)

(define (fuel-for-masses fuel-calculator masses)
  (apply +
    (map fuel-calculator masses)
  )
)

(define (aoc fuel-calculator input_file)
  (fuel-for-masses
    fuel-calculator
    (map
      string->number
      (file->lines input_file)
    )
  )
)

; Solution for AOC Day 1 challenge 2
(define (fuel-for-mass-handling-fuel-mass mass)
  (let ([fuel_mass (fuel-for-mass mass)])
    (if (> fuel_mass 0)
        (+ fuel_mass (fuel-for-mass-handling-fuel-mass fuel_mass))
        0
    )
  )
)

; Unit tests for AOC Day 1 challenges 1 and 2
(require rackunit)
(define-test-suite aoc-day1
  (test-case "test-fuel-for-mass"
    (check-eq? (fuel-for-mass 12) 2)
    (check-eq? (fuel-for-mass 14) 2)
    (check-eq? (fuel-for-mass 1969) 654)
    (check-eq? (fuel-for-mass 100756) 33583)
  )

  (test-case "test-aoc-day1-1"
    (check-eq? (aoc fuel-for-mass "/Users/julien/Desktop/input.txt") 3271994)
  )

  (test-case "test-fuel-for-mass-handling-fuel-mass"
    (check-eq? (fuel-for-mass-handling-fuel-mass 14) 2)
    (check-eq? (fuel-for-mass-handling-fuel-mass 1969) 966)
    (check-eq? (fuel-for-mass-handling-fuel-mass 100756) 50346)
  )
  (test-case "test-aoc-day1-2"
    (check-eq? (aoc fuel-for-mass-handling-fuel-mass "/Users/julien/Desktop/input.txt") 4905116)
  )
)

(require rackunit/text-ui)
(run-tests aoc-day1)