#import "../../utils/core.typ": * 

== Перестановки предела и интеграла

#th(name: "Леви (напоминание)")[
    Пусть $0 <= f_1 <= f_2 <= f_3 <= ...$ и $f_n --> f$ почти везде. Тогда $lim INT(f_n) = INT(f)$.
]

#follow(plural: true)[
    1. Если $f_n >= 0$, то $INT(sum_(n = 1)^oo f_n) = sum_(n = 1)^oo INT(f_n)$.
    2. Если $sum_(n = 1)^oo INT(abs(f)) < +oo$, то $sum_(n = 1)^oo f_n (x)$ абсолютно сходится при почти всех $x in E$.
]

#proof[
    1. Пусть $S_n := sum_(n = 1)^oo f_n (x)$, тогда $0 <= S_1 <= S_2 <= ...$. $S_n --> S := sum_(k = 1)^n f_k$. По теореме Леви 
        $ underbrace(sum_(k = 1)^n INT(f_k), --> sum_(k = 1)^oo INT(f_k)) = INT(sum_(k = 1)^n f_k) = INT(S_n) --> INT(S) $
    
    2. $INT(sum_(n = 1)^oo abs(f_n)) = sum_(n = 1)^oo INT(abs(f_n)) < +oo$. Обозначим $tilde(S) = sum_(n = 1)^oo abs(f_n)$. Оно почти везде конечно. Значит $sum_(n = 1)^oo abs(f_n)$ сходится при почти всех $x in E$, то есть $sum_(n = 1)^oo f_n (x)$ абсолюбтно сходится при почти везде $x in E$.
]

#lemma(name: "Фату")[
    Пусть $f_n >= 0$. Тогда
    $ liminf INT(f_n) >= INT(liminf f_n) $
]

#proof[
    Пусть $g_n := inf_(k >= n) f_k$. Тогда $0 <= g_1 <= g_2 <= ...$ и $liminf f_n = lim g_n$, значит $ INT(liminf f_n) = INT(lim g_n) =^"т. Леви" lim INT(g_n) = liminf INT(g_n) <= liminf INT(f_n). $
]

#notice[
    Равенства может не быть. Если $f_n := n bb(1)_[0, 1/n]$, то
    $
        INT(E: [0, 1], f_n, mu: lambda) = 1 != 0 = INT(E: [0, 1], lim f_n, mu: lambda),
    $
    так как $f_n --> 0$ почти везде.
]

#th(name: "Усиленный вариант теоремы Леви")[
    Пусть $f_n >= 0$, $f_n --> f$ почти везде, и $f_n <= f$. Тогда $lim INT(f_n) = INT(f)$.
]

#proof[
    $ f_n <= f ==> INT(f_n) <= INT(f) ==> limsup INT(f_n) <= INT(f). $
    Применим лемму Фату:
    $ INT(f) = INT(liminf f_n) <= liminf INT(f_n) <= limsup INT(f_n) <= INT(f). $
    Слева и справа одно и тоже, поэтому везде равенства.
    $ liminf INT(f_n) = limsup INT(f_n) = INT(f). $
]

#th(name: "Лебега о предельном переходе (о мажорируемой сходимости)")[
    Пусть $abs(f_n) <= F$, а $F$ суммируема на $E$, и $f_n --> f$ почти везде. Тогда $lim INT(f_n) = INT(f)$. Более того, $INT(abs(f_n - f)) --> 0$.
    
    Такая $F$ называется _суммируемой мажорантой_.
]

#proof[
    Пусть $h_n := 2F - abs(f_n - f) <= 2F$. Тогда $h_n --> 2F$ почти везде. $h_n >= 2F - abs(f_n) - abs(f) >= 0$. По усилинному варианту теоремы Леви,
    $
        INT(2F) - INT(abs(f_n - f)) = INT(h_n) --> INT(2F).
    $
    Отсюда $INT(abs(f_n - f)) --> 0$ (при сокращении использовали суммируемость). В частности, $ abs(INT(f_n) - INT(f)) = abs(INT((f_n - f))) <= INT(abs(f_n - f)) --> 0. $
]

#exercise[
    Сверху есть замечание про $f_n = n bb(1)_[0, 1/n]$. Показать, что у такой функции нет суммируемой мажоранты.
]

#th[
    Если $f in C[a, b]$, то интегралы Римана и Лебега (по мере Лебега) совпадают.
]

#proof[
    Если $f$ непрерывная, то $f$ измерима относительно меры Лебега. Рассмотрим разбиение отрезка $a = x_0 < x_1 < x_2 < ... < x_n = b$. Заведем римановы суммы $ 
        S_* &= sum_(k = 1)^n min_(t in [x_(k - 1), x_k]) f(t) dot (x_k - x_(k - 1)) \ 
        S^* &= sum_(k = 1)^n max_(t in [x_(k - 1), x_k]) f(t) dot (x_k - x_(k - 1)) \ 
    $
    Если мелкость дробления стремится к 0, то $S_*$ и $S^*$ стремятся к $integral_a^b f(x) dif x$.

    $ g_*(x) = min_(t in [x_(k - 1), x_k]) f(t) "если" x in [x_(k - 1), x_k) ==> S_* = integral_[a, b] g_* dif lambda. $
    Аналогично,
    $
        g^*(x) = max_(t in [x_(k - 1), x_k]) f(t) "если" x in [x_(k - 1), x_k) ==> S^* = integral_[a, b] g^* dif lambda.
    $
    $g_* <= f <= g^*$ почти везде, поэтому $ integral_a^b f dif x <-- S_* = integral_[a, b] g_* dif lambda <= integral_[a, b] f dif lambda <= integral_[a, b] g^* dif lambda = S^* --> integral_a^b f dif x $
]

#th[
    Если $f: [a, b] --> RR$ ограничена и интегрируема по Риману на $[a, b]$, то она измерима, и интегралы совпадают: $integral_a^b f(x) dif mu = integral_[a, b] f dif lambda$.
]

#proof[
    Доказательства не будет: у нас недостаточно свойств интеграла Римана. Ну и правильно, ну его, этот интеграл Римана, пойду лучше поем.
]

#th(name: "критерий Лебега для интегрируемости по Риману")[
    $f: [a, b] --> RR$ ограничена. Тогда $f$ интегрируема по Риману на $[a, b]$ тогда и только тогда, когда множество точек разрыва имеет нулевую меру Лебега.
]

#proof[
    Доказательства не будет. Зачем нам это? И так интеграл Римана не исследован, куда в такой помойке копаться? Идите лучше поешьте.
]
