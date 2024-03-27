#import "../../utils/core.typ": *

== Конформные отображения

#let tOmega = $tilde(Omega)$

#def[
    Пусть $Omega$ и $tOmega$ --- две области. $f$ называется _конформным отображением_ $Omega$ на $tOmega$, если $f in H(Omega)$ и $f$ --- биекция.
]

#th[
    $f in H(Omega)$, $f'(a) != 0$. Тогда $f$ сохраняет углы между кривыми, проходящими через $a$. Под "углом между кривыми" имеется в виду угол между касательными в точке пересечения. Через пару утверждений мы поймем, что от $f'(a) != 0$ можно отказаться, так как это всегда верно.
]

#proof[
    Пусть $gamma : [alpha, beta] --> CC$, и $gamma(alpha) = a$. 
    $
        (f(gamma(z)))' = f' (gamma(z)) dot gamma'(z),\
        (f compose gamma)'(alpha) = f'(a) dot gamma'(alpha).
    $
    Вектор $gamma'(alpha)$ повернулся на $arg f'(a)$. А аргумент производной --- это и есть направление касательной в точке. Значит обе касательные повернуться одинаково, и угол сохранится.
]

#th[
    Пусть $f in H(Omega)$, $f equiv.not const$. $Omega$ --- область, значит $f(Omega)$ --- область.
]

#proof[
    Линейная связность сохраняется: как была кривая между точками на области, так она в кривую и переходит.

    Проверим, что $f(Omega)$ открыто. Берем $b in f(Omega)$, то есть $b = f(a)$. Существует $eps > 0$ такой, что $abs(f(z) - b) != 0$ при $abs(z - a) = eps$, так как иначе в каждой окружности найдется такая точка, и по теореме о единственности, $f(z) equiv b$, а это не так по условию. Найдется $eps > 0$ такой, что $abs(f(z) - b) > 0$ для каждого $abs(z - a) = eps$.

    Положим $r := min_(abs(z - a) = eps) abs(f(z) - b)$. Рассмотрим кружочек вокруг $b$ радиусом $r/2$, и поинтересуемся количеством решений уравнения $f(z) = w$. Можно расписать,
    $
        (f(z) - w) = (f(z) - b) + (b - w).
    $
    Первая штука имеет хотя бы один корень, $f(z) = a$. А еще мы знаем $abs(f(z) - b) >= r > abs(b - w)$ на $abs(z - a) > eps$, и по теореме Руше $Nn_(f - w) = Nn_(f_b) >= 1$. Значит любая точка в окрестности $b$ радиуса $r/2$ лежит в образе. Вот и открытость.
]

#def[
    $f$ --- _однолистная_ в $Omega$, если $f in H(Omega)$ и инъективная. 
]

#notice[
    1. Если $f$ --- конформное отображение $Omega$ на $f(Omega)$, то $f$ --- однолистная в $Omega$. 
    2. Если $f$ --- однолистная в $Omega$, то $f$ --- конформное отображение $Omega$ на $f(Omega)$. 
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

#follow[
    1. Конформное отображение сохраняет углы между кривыми.
        Это усиленная версия теоремы о сохранении углов, не требующая того, что производная в точке не $0$.
    2. Если $f(z) = c_0 + c_1/z + c_2/z^2 + ...$ однолистна в окрестности $oo$, то $c_1 != 0$.
    3. Если $a$ --- изолированная (неустранимая) особая точка $f$, и $f$ однолистна в проколотой окрестности $a$, то $a$ --- полюс первого порядка.
    4. Если $f in H(overline(CC) without {z_0})$ однолистна, то $f$ --- дробно линейная.
]

#proof[
    1. Из конформности следует однолистность, значит $f' != 0$ нигде, значит, она сохраняет углы.
    2. Пусть $g(z) := f(1/z)$ однолистна в проколотой окрестности $0$. Тогда $g(z) = c_0$ не более чем в одной точке. Уменьшим окрестность так, что эта точка в нее не попадет. Доопределим
        $
            g(z) = cases(c_0\, z = 0, f(1/z)\, z != 0).
        $
        Такая функция однолистна (и голоморфна) в окрестности $0$, значит $g'(0) = c_1 != 0$.
    3. Пусть $a$ --- существенная особая точка. Тогда по теореме Сохоцкого, замыкание множества значений в окрестности --- все $overline(CC)$. Возьмем $z_0$ близко к $a$, и $f(z_0) = b$. Тогда можно рассмотреть небольшую окрестность $a$ радиуса $2r$, в которой не лежит $z_0$. А еще $f(0 < abs(z - a) < r)$ --- открытое множество (образ области --- область). С другой стороны, $f(abs(z - z_0) < r)$ --- тоже открытое. Из однолистности (инъективности) следует, что
        $ f(abs(z - z_0) < r) sect f(0 < abs(z - a) < r) = nothing ==> f(0 < abs(z - a) < r) subset CC without f(abs(f - f_0) < r). $
        Справа написано замкнутое множество, значит и замыкание лежит в нем:
        $
            CC = Cl f(0 < abs(z) < r) subset CC without f(abs(f - f_0) < r) subset CC without {b}.
        $
        Противоречие.
        Значит $a$ --- полюс. Рассмотрим $g(z) = 1/f(z)$ --- голоморфную функцию в окрестности $a$. Тогда $g(z)$ --- однолистна в окрестности $a$, следовательно $g'(a) != 0$. Значит $а$ --- нуль первого порядка $g$, и $a$ --- полюс первого порядка $f$. 

    4. 
        - Пусть $z_0 != oo$. Если $f in H(overline(CC))$, то $f equiv const$. Если $z_0$ --- особая, то по предыдущему следствию это полюс первого порядка. Тогда рассмотрим $g(z) = f(z) - c/(z - z_0)$. Мы вычли из $f$ главную часть ее ряда Лорана, значит остаток $g$ --- голоморфная на $overline(CC)$, и $g equiv const$.

        - Пусть $z_0 = oo$. Это полюс первого порядка, по предыдущему следствию (даже для бесконечности это верно --- можно подставить $1/z$ и рассмотреть окрестность $0$). Тогда аналогично $g(z) = f(z) - c z in H(overline(CC))$, и $g equiv const$. Значит $f(z) = const + c z$. В этом случае $f$ даже линейна.
]

#th(name: "Римана о конформных отображениях")[
    Пусть $Omega$ и $tilde(Omega)$ --- односвязные области, и их границы составляют более чем одну точку. Пусть $z_0 in Omega$, $tilde(z)_0 in Omega$, $alpha in RR$. Тогда существует единственное конформное отображение $f: Omega --> tilde(Omega)$ такое, что $f(z_0) = tilde(z)_0$, и $arg f'(z_0) = alpha$.
]

#notice[
    Неодноточечность границы нужна. Не существует конформного отображения $CC$ в $DD = {abs(z) < 1}$, так как $f: CC --> DD$ голоморфна, и значит по теореме Луивилля $f equiv const$. Значит нет однолистности.
]

#notice[
    Односвязность тоже нужна. Например, $Omega = {z: 1 < abs(z) < 2}$ не перевести конформно в $tilde(Omega) = {z: abs(z) < 2, abs(z - 0.5) < 0.3}$. Доказывать не будем.
    #TODO[картинка]
]

#follow[
    Пусть $f in H(CC)$ и $f$ не принимает значения на неодноточечной кривой $gamma$. Тогда $f$ --- константа.
]

#proof[
    Рассмотрим $CC without gamma$ и по теореме Римана отобразим ее в единичный круг $DD$ преобразованием $g$. Рассмотрим $g compose f$. Это отображение голоморфно на $CC$, и образ ограничен. Значит по теореме Лиувилля $g(f(z)) equiv const$. А $g$ --- биекция, значит $f equiv g^(-1) (const) = const$.
]

#notice(name: "малая теорема Пикара")[
    Если $f in H(CC)$ и $f$ не константа, то $f$ принимает все значения, кроме, возможно, одного, на $CC$.
]

#proof[
    Не-а. Без доказательства.
]

#example[
    Пусть $e^z in H(CC)$ и не обращается в $0$, поэтому одна точка и правда может не приниматься.
]


#follow[
    Если $f: CC --> overline(CC)$ мероморфная, и $f$ не константа, то $f$ принимает все значения, кроме, возможно, не более двух.
]

#proof[
    Пусть $f$ не принимает значения $a$, $b$ и $c$, и пусть $a != oo$. Рассмотрим
    $
        g(z) := 1/(f(z) - a) in H(CC).
    $
    Голомфорность следует из того, что $f(z) != a$. А еще $g != 1/(b - a)$ и $g != 1/(c - a)$. По малой теореме Пикара, это значит, что $g$ --- константа. Значит $f$ --- тоже.
]

#example[
    $tg$ мероморфен в $CC$, и $tg != plus.minus i$. Поэтому две точки действительно могут не приниматься.
]
