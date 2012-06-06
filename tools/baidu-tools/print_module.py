#/bin/env python
"""
MAX_NUM = 100
advs = range(1,MAX_NUM)
prob_array = []
dup_num = 5
factor = 0.75
min_prob = 0.15
max_prob = 0.85
expect = 0;
"""
def calc_expect(minprob, maxprob, start, step, factor, num):
    """ last = empty(0) """
    x = range(1, num+1) 
    expection = 0
    for i in x:
        int_i = int(i)
        if int_i > start:
            tmp = int(int_i / step) ** factor * minprob 
            """tmp = (factor ** (int_i / step)) * minprob"""
            tmp = min([tmp, maxprob])
        else:
            tmp = 0
        expection = expection + 1 - tmp
        """print int_i, tmp, expection"""
        """last = append(last, tmp)"""
        """ plt.plot(x, last) """
    return expection

if __
advs = range(1, 700)
for adv in advs
    print calc_expect(0.119, 0.85, 10, 1, 1.044, adv)

    
"""for i in advs:
    prob_array.append(min((i/dup_num)**factor*min_prob, max_prob));

for i in advs:
    j = i;
    k = i+1;
    p_tmp = 1;
    while j >= 1:
        p_tmp *= (1 - prob_array[j-1])
        j = j - 1;
    while k < MAX_NUM:
        p_tmp *= prob_array[k-1]
        k = k + 1;
    expect += i * p_tmp

print expect;
"""  
