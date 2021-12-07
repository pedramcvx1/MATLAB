x=input('lotfan x ra be sorate matris vared konid: ')
mu=input('lotfan addade morede nazar ra vared konid: ')
function xdot = fcn(x,mu)
xdot = [x(2)
    mu*(1-x(1)^2)*x(2)-x(1)];

end