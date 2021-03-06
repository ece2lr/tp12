// quadrique associée à une matrice 2x2 

//// points critiques non-dégénérés   ///////////
Q = eye(2,2) // minimum : x^2 + y^2
//Q = [0,1;1,0] // point selle : 2xy
//Q = [1,0;0,-1] // point selle : x^2 - y^2
//Q = - eye(2,2) // maximum : - x^2 - y^2
//// points critiques dégénérés       ///////////
//Q = [1 0; 0 0] // minimum dégénéré : x^2
//Q = [-1 0; 0 0] // maximum dégénéré : -x^2

// résolution graphique
N = 100
// base disque
r = linspace(0,1,N)
theta = linspace(0,2*%pi,N)
[R,Theta] = meshgrid(r,theta)
X = R .* cos(Theta)
Y = R .* sin(Theta)
//// base carrée
//x = linspace(-1,1,N)
//[X,Y] = meshgrid(x,x)

Z = Q(1,1) * X.^2 + Q(2,2) * Y.^2 + (Q(2,1)+Q(1,2)) * X.*Y

clf()
surf(X,Y,Z-min(Z))

// Cosmétique {{{
a = gca()
a.isoview = "on"
//a.data_bounds = [ -1, -1, -1; 1, 1, 1]
a.children.thickness = 0
f = gcf()
//f.color_map = .1 + .8*bonecolormap(32) // on croppe le noir et le blanc
f.color_map = parulacolormap(32) // on croppe le noir et le blanc
// }}}

N = 10
x = linspace(-1,1,N)
y = linspace(-1,1,N)
[X,Y] = meshgrid(x,y)
//Z = Q(1,1) * X.^2 + Q(2,2) * Y.^2 + (Q(2,1)+Q(1,2)) * X.*Y
fX = 2 * Q(1,1) * X + (Q(2,1)+Q(1,2)) * Y
fY = (Q(2,1)+Q(1,2)) * X + 2 * Q(2,2) * Y

champ(x,y,fX',fY')
//help champ
a = gca()
a.view = "3d"
