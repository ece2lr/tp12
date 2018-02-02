OMEGA = 7
AMPLITUDE = .2

function z = f(x, y)
  z = AMPLITUDE * ( cos(OMEGA * x) + cos(OMEGA * y) )
endfunction

N = 100
x = linspace(-1,1,N)
y = linspace(-1,1,N)
[X, Y] = meshgrid(x, y)

clf()
surf(X, Y, f(X, Y))

// Cosmétique {{{
a = gca()
a.isoview = "on"
a.data_bounds = [ -1, -1, -1; 1, 1, 1]
a.children.thickness = 0
f = gcf()
f.color_map = .1 + .8*bonecolormap(32) // on croppe le noir et le blanc
// }}}
