from thinkbayes import Pmf

class Cookie(Pmf):

    def __init__(self, hypos):
        Pmf.__init__(self)
        for hypo in hypos:
            self.Set(hypo, 1)
        self.Normalize()


hypos = ['Bowl1', 'Bowl2']
pmf = Cookie(hypos)
