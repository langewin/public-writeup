n = 28152737628466294873353447700677616804377761540447615032304834412268931104665382061141878570495440888771518997616518312198719994551237036466480942443879131169765243306374805214525362072592889691405243268672638788064054189918713974963485194898322382615752287071631796323864338560758158133372985410715951157

x, enc = (1480204288, 20680456596798972166152664014683667547438495790508999740833997133841509041177508952585852743598779247047635149345662771683808615717036612148635615291873193398225813497705608303137167610635800736350031630900305919232053815771672154936684073516713631004495325067413506143282335567253266043469682017665375451)

# recovered from factoring n
p = 531268630871904928125236420930762796930566248599562838123179520115291463168597060453850582450268863522872788705521479922595212649079603574353380342938159
q = 52991530070696473563320564293242344753975698734819856541454993888990555556689500359127445576561403828332510518908254263289997022658687697289264351266523
assert(p*q == n)
phi = (p-1)*(q-1)

Z = Zmod(p)
emodp = ZZ(Z(enc).log(Z(x)))
Z = Zmod(q)
emodq = ZZ(Z(enc).log(Z(x)))

e = crt([emodp, emodq], [p,q])
print("e = {}".format(e))
d = inverse_mod(e, phi)

flag = 0x0617271506da7ba7143c72553c1a881d13acd3d0f12a72b6dc634af9114b4d8fc1a08a902ac365a4f454fd67a1fb8921aa4c48a680d02e7f446dd1869fdb3f3c80e1e0590458ab349758a89b92a3a8a37d296c747094ba0c8b99ddb02285cf183bf861c562b414724c0bb8367e50d105ec065e4cc426910729fa2b6c7ec817

print(repr(ZZ(pow(flag, d, n)).hex().decode('hex')))
