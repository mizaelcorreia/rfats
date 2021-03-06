# Financial Calculation
#https://rpubs.com/Felix/7120

library(FinCal)
ls("package:FinCal")

help(pv)    # display the documentation for the function
args(pv)    # see arguments of the function
example(pv) # see example of using the function

#Computing effective annual rate (EAR)
#Using a stated rate of 4.25%, compute EARs for semiannual, quarterly, monthly, daily and continuous compounding.

#half early
ear(0.0425, 2)
## [1] 0.04295
#quarterly
ear(0.0425, 4)
## [1] 0.04318
#monthly
ear(0.0425, 12)
## [1] 0.04334
#daily
ear(0.0425, 365)
## [1] 0.04341

ear.continuous(0.0425)
## [1] 0.04342


#Example 2 Future value (FV) of a single sum
#Calculate the FV of a $500 investment at the end of ten years if it earns an annually compounded rate of return of 6%.

fv.simple(r = 0.06, n = 10, pv = -500)


#PV of a single sum
#Given a discount rate of 3%, calculate the PV of a $1,000,000 cash flow that will be received in five years.

pv.simple(r = 0.03, n = 5, fv = 1e+06)
#1] -862609

#Example 4 FV of an ordinary annuity and annuity due
#What is the future value of an ordinary annuity that pays $15,000 per year at the end of each of the next 25 years, given the investment is expected to earn a 6% rate of return?
  
fv.annuity(r = 0.06, n = 25, pmt = -15000, type = 0)
## [1] 822968

#What is the future value of an annuity that pays $10,000 per year at the beginning of each of the next three years, commencing today, if the cash flows can be invested at an annual rate of 5%?
  
fv.annuity(r = 0.05, n = 3, pmt = -10000, type = 1)
## [1] 33101

#Example 5 PV of an ordinary annuity and annuity due
#What is the PV of an annuity that pays $20,000 per year at the end of each of the next 25 years, given a 6% discount rate?
  
pv.annuity(r = 0.06, n = 25, pmt = -20000, type = 0)
## [1] 255667

#Given a discount rate of 10%, what is the present value of a 10-year annuity that makes a series of $1000 payments at the beginning of each of the next three years, starting today?
  
pv.annuity(r = 0.1, n = 10, pmt = -1000, type = 1)
## [1] 6759


#Example 6 PV of a perpetuity
#A preferred stock that will pay $2.50 per year in annual dividends beginning next year and plans to follow this dividend policy forever. Given an 10% rate of return, what is the value of this preferred stock today?
  
pv.perpetuity(r = 0.1, pmt = 2.5, type = 0)
## [1] -25

#Example 7 Rate of return for a perpetuity
#Using the preferred stock described in the preceding example, determine the rate of return that an investor would realize if she paid $75 per share for the stock.

r.perpetuity(pmt = 2.5, pv = -75)
## [1] 0.03333

#Example 8 PV of a bond's cash flows
#A bond will make coupon interest payments of 70 HK$ (7% of its face value) at the end of each year and will also pay its face value of 1,000 HK$ at maturity in 10 years. If the appropriate discount rate is 6%, what is the present value of the bond's promised cash flows?
  
pv(r = 0.06, n = 10, fv = 1000, pmt = 70, type = 0)
## [1] -1074

#Example 9 Computing the FV and PV of an uneven cash How series
#Using a rate of return of 6%, compute the future value of the 6-year uneven cash flow stream occured at the end of each year. (-10000 -5000 2000 4000 6000 8000)

fv.uneven(r = 0.06, cf = c(-10000, -5000, 2000, 4000, 6000, 8000))
## [1] -1542

#Compute the present value of this 6-year uneven cash How stream described above using a 10% rate of return.

pv.uneven(r = 0.1, cf = c(-10000, -5000, 2000, 4000, 6000, 8000))
## [1] 747.1


#Example 10 Loan payment calculation: Annual payments and Quarterly payments
#A company plans to borrow $500,000 for five years. The company's bank will lend the money at a rate of 6% and requires that the loan be paid off in five equal end-of-year payments. Calculate the amount of the payment that the company must make in order to fully amortize this loan in five years.

pmt(r = 0.06, n = 5, pv = 5e+05, fv = 0)
## [1] -118698

#Example 11 Computing the number of periods in an annuity
#How many $1000 end-of-year payments are required to accumulate $10,000 if the discount rate is 9%?
  
n.period(r = 0.09, pv = 0, fv = 10000, pmt = -1000, type = 0)
## [1] 7.448

#Example 12 Computing the rate of return for a period
#Suppose you have the opponunity to invest $1000 at the end of each of the next five years in exchange for $6000 at the end of the fifth year. What is the annual rate of return on this investment?
  
discount.rate(n = 5, fv = 6000, pmt = -1000, pv = 0, type = 0)
## [1] 0.0913

#Example 13 Computing NPV
#Calculate the NPV of an investment project with an initial cost of $6 million and positive cash flows of $2.6 million at the end of Year 1, $2.4 million at the end of Year 2, and $3.8 million at the end ofYear 3. Use 8% as the discount rate.

npv(r = 0.08, cf = c(-6, 2.6, 2.4, 3.8))
## [1] 1.482

#Example 14 Computing IRR
#What is the IRR for the investment described in example 13?
  
irr(cf = c(-6, 2.6, 2.4, 3.8))
## [1] 0.2033

#Example 15 Computing HPR
#Suppose a stock is purchased for $3 and is sold for $4 six months later, during which time it paid $0.50 in dividends. What is the holding period return?
  
hpr(ev = 4, bv = 3, cfr = 0.5)
## [1] 0.5

#Example 16 Computing time-weighted rate of return
#An investor purchases a share of stock at t = 0 for $10. At the end of the year, t = 1 , the investor buys another share of the same stock for $12. At the end of Year 2, the investor sells both shares for $13 each. At the end of both years 1 and 2, the stock paid a $1 per share dividend. What is the annual time-weighted rate of return for this investment?
  
twrr(ev = c(12, 26), bv = c(10, 24), cfr = c(1, 2))
## [1] 0.2315

#Example 17 Computing Bank discount yield
#Calculate the bank discount yield for a T-hill priced at $9,850, with a face value of $10,000 and 120 days until maturity.
bdy(d = 150, f = 10000, t = 120)

## [1] 0.045

#Example 18 Convert holding period return to the effective annual rate
#Compute the EAY using the 120-day HPY of 2.85%.

hpr2ear(hpr = 0.0285, t = 120)
## [1] 0.08923

#Example 19 Computing money market yield
#What is the money market yield for a 120-day T-bill that has a bank discount yield of 4.50%?
  
  bdy2mmy(bdy = 0.045, t = 120)
## [1] 0.04569

#Example 20 Converting among EAR, HPY, and MMY
#Assume the price of a $10,000 T-hill that matures in 150 days is $9,800. The quoted money market yield is 4.898%. Compute the HPY and the EAR.

hpr(ev = 10000, bv = 9800)
## [1] 0.02041

mmy2hpr(mmy = 0.04898, t = 150)
## [1] 0.02041
hpr2ear(hpr = mmy2hpr(mmy = 0.04898, t = 150), t = 150)
## [1] 0.05039
ear2hpr(ear = hpr2ear(hpr = mmy2hpr(mmy = 0.04898, t = 150), t = 150), t = 150)
## [1] 0.02041
#Example 21 Bond-equivalent yield calculation
What is the yield on a bond-equivalent basis of a 3-month loan has a holding period yield of 4%?
  
  hpr2bey(hpr = 0.04, t = 3)
## [1] 0.1632
What is the yield on a bond-equivalent basis of an investment with 6% effective annual yield?
  
  ear2bey(ear = 0.06)
## [1] 0.05913
Example 22 Weighted mean as a portfolio return
A portfolio consists of 40% common stocks, 50% bonds, and 10% cash. If the return on common stocks is 9%, the return on bonds is 6%, and the return on cash is 1%, what is the portfolio return?
  
  wpr(r = c(0.09, 0.06, 0.01), w = c(0.4, 0.5, 0.1))
## [1] 0.067
or

rs = c(0.09, 0.06, 0.01)
ws = c(0.4, 0.5, 0.1)
wpr(r = rs, w = ws)
## [1] 0.067
Example 23 Geometric mean return
For the last three years, the returns for Acme Corporation common stock have been -5%, 11%, and 9%. Compute the compound annual rate of return over the 3-year period.

geometric.mean(r = c(-0.05, 0.11, 0.09))
## [1] 0.04751
Example 24 Calculating average cost with the harmonic mean
An investor purchases $10,000 of stock each month, and over the last three months the prices paid per share were $4.5, $5.2, and $4.8. What is the average cost per share for the shares acquired?
  
  harmonic.mean(p = c(4.5, 5.2, 4.8))
## [1] 4.816


