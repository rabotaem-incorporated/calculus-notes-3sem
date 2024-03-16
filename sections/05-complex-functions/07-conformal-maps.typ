#import "../../utils/core.typ": *

== Конформные отображения

#let tOmega = $tilde(Omega)$

#def[
    Пусть $Omega$ и $tOmega$ --- две области. $f$ называется _конформным отображением_ $Omega$ на $tOmega$, если $f in H(Omega)$ и $f$ --- биекция.
]

#th[
    $f in H(Omega)$, $f'(a) != 0$. Тогда $f$ сохраняет углы между кривыми, проходящими через $a$. Под "углом между кривыми" имеется в виду угол между касательными в точке. 
]

#proof[
    Пусть $gamma : [alpha, beta] --> CC$, и $gamma(alpha) = a$. 
    $
        (f(gamma(z)))' = f' (gamma(z)) dot gamma'(z),\
        (f compose gamma)'(alpha) = f'(a) dot gamma'(alpha).
    $
    Вектор $gamma'(alpha)$ повернулся на $arg f'(a)$. А это и есть направление касательной в точке. Значит обе касательные повернуться одинаково, и угол сохранится.
]

#th[
    Пусть $f in H(Omega)$, $f equiv.not const$. $Omega$ --- область, значит $f(Omega)$ --- область.
]

#proof[
    Линейная связность сохраняется: как была кривая между точками на области, так она в кривую и переходит.

    Проверим, что $f(Omega)$ открыто. Берем $b in f(Omega)$, то есть $b in f(a)$. Существует $eps > 0$ такой, что $abs(f(z) - b) != 0$ при $abs(z - a) = eps$, так как иначе в каждой окружности найдется такая точка, и по теореме о единственности, $f(z) equiv b$, а это не так по условию. Найдется $eps > 0$ такой, что $abs(f(z) - b) > 0$ для каждого $abs(z - a) = eps$.

    Положим $r := min_(abs(z - a) = eps) abs(f(z) - b)$. Рассмотрим кружочек вокруг $b$ радиусом $r/2$, и поинтересуемся количеством решений уравнения $f(z) = w$. Можно расписать,
    $
        (f(z) - w) = (f(z) - b) + (b - w).
    $
    Первая штука имеет хотя бы один корень, $f(z) = a$. А еще мы знаем $abs(f(z) - b) >= r > abs(b - w)$ на $abs(z - a) > eps$, и по теореме Руше $Nn_(f - w) = Nn_(f_b) >= 1$. Значит любая точка в окрестности $b$ радиуса $r/2$ лежит в образе. Вот и открытость.
]

#def[
    $f$ --- _однолистная_ в $Omega$, если $f in H(Omega)$ и инъективная. 
]

#follow[
    Если $f$ --- однолистная в $Omega$, то $f$ --- конформное отображение $Omega$ на $f(Omega)$. 
]

#th[
    Если $f$ однолистная, то производная нигде не 0: $f'(z) != 0 space forall z in Omega$.
]

#proof[
    От противного. Пусть $f'(a) = 0$ и $f(a) = b$. Проделаем все тоже рассуждение из доказательства предыдущей теоремы для точки $a$. Тогда количество нулей внутри какой-то окрестности $a$ функций $f - b$ и $f - w$ равны и
    $
        Nn_(f - w) = Nn_(f - b) >= 2,
    $
    так как $a$ --- кратный корень ($f'(a) = 0$). Тогда возможно 2 случая:
    - $f$ в двух точках принимает значение $w$, но тогда она не однолистная (не инъективная).
    - $f(z) = w$ имеет кратный корень. Но в такой точке $z_w$ обнуляется производная: $f'(z_w) = 0$.
    И производная обнуляется в каждом круге, где не достигается значение $b$. Значит производная --- тождественный нуль, и $f equiv const$, а это не инъекция.
]
