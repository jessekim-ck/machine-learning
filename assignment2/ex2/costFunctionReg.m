function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


% thetas need to be regularized
n = length(theta);
I_modif = eye(n);
I_modif(1, 1) = 0;
theta_reg = I_modif*theta;

% regularize
[J_unreg, grad_unreg] = costFunction(theta, X, y) 

J = J_unreg + (lambda/(2*m))*(transpose(theta_reg)*theta_reg);

grad = grad_unreg + (lambda/m)*theta_reg;


% =============================================================

end
