M=50;
N=200;
q = .3;
U = zeros(M,N);
U(25,1)=1;

for i=2:N
	U(2:(M-1),i) = (1-2*q)*U(2:(M-1),i-1) + q*U(1:(M-2),i-1) +q*U(3:M,i-1);
	U(1,i) = (1-2*q)*U(1,i) + q*U(2,i) + q*U(M,i);
	U(M,i) = (1-2*q)*U(M,i) + q*U(1,i) + q*U(M-1,i);
end
