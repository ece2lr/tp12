clf()
x = 0:3
plot2d3(x,x.^2)

clf()
N = 5
x = linspace(-1,1,N)
y = linspace(-1,1,N)

[X,Y] = meshgrid(x,y)

Z = exp(X .* Y)

clf()
//plot3d(x,y,Z)
surf(X,Y,Z)
