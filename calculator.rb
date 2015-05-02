class Calculator
    class << self
        def compound_interest_for_principal(p, r, n, t)
            p * (rate_of_increase(r, n)**num_of_compounds(n, t))
        end

        def future_value_of_series(c, r, n, t)
            c * (((rate_of_increase(r, n)**num_of_compounds(n, t)) - 1) / monthly_rate(r, n))
        end

        private

        def rate_of_increase(r, n)
            1 + monthly_rate(r, n)
        end

        def monthly_rate(r, n)
            r / n
        end

        def num_of_compounds(n, t)
            n * t
        end
    end
end
