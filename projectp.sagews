from sage.misc.prandom import randrange, randint

print '='*16
print 'LEVEL 1'
print '='*16

p = next_prime(10000)
print 'p', p

d = 8
#d = randrange(3, 9)
#k = randrange(1, 1000)
#a = randrange(1, 1024)

b = randrange(1, 1000)
a = power_mod(b,d,p)
k = power(b,d) - a
k = float(k)/p

print 'b', b
print 'a', a
print 'k', k

x = PolynomialRing(IntegerRing(), 'x').gen()

f = (x^d - a)
print 'debug', (k*p)-a
m = ((k*p)-a)^(float(1)/d)
g = (x - m)

print 'f', f
print 'm', m
print 'g', g

print '='*16
print 'LEVEL 2: find a & b'
print '='*16

def check_smooth(n, B):
    listz = list(factor(n))
    for x in listz:
        if x[0]>B:
            return False

    return True

c = 2022

print 'c', c

a_ = None
b_ = None

B = 9
m = m # Level 1

def rarb(c, B, B_, m, d):
    for ra in xrange(-c, c+1):
        for rb in xrange(1, c+1):
            zx = abs(ra-rb*m)
            #print zx
            if check_smooth(int(zx), B): # m from Level 1
                norm = f(ra/rb) * pow(rb,d)
                if check_smooth(norm, B_):
                    return ra, rb

    return None, None # should not happen :x

a_, b_ = rarb(c, B, B, m, d)
print 'a', a_
print 'b', b_

print '='*16
