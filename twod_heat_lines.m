global D N dx T;
D=0.1;
N=20;
L=20;
Tend = 100;

dx=L/N;

G0 = ones(N,N);
P0 = ones(N,N);
S0 = zeros(N,N);
alph=0.1;
A=10;
for i=1:N
	for j=1:N
		x=i*dx;
		y=j*dx;
		S0(i,j)=A * e^(-alph * ( (x-L/2)^2 + (y-L/2)^2 ) );
	end
end

T = -2*eye(N,N);
T(1,1+1)=1;
T(1,N  )=1;
for i=2:N-1
	T(i,i+1)=1;
	T(i,i-1)=1;
end
T(N,1  )=1;
T(N,N-1)=1;

function YP = fun(t,y)
	global N T dx D;
	S=reshape(y(1:N*N),N,N);
	P=reshape(y(N*N+1:2*N*N),N,N);
	G=reshape(y(2*N*N+1:end),N,N);

	V=S.*P.*G./(1+S.*G);

	SP=D/dx^2 * ( T*S + S*T )-V;
	GP=D/dx^2 * ( T*G + G*T )-V;
	PP=V;

	YP = [vec(SP); vec(PP); vec(GP)];
	
end

Y0 = [vec(S0); vec(P0); vec(G0)];

sol = ode45(@fun,[0,Tend],Y0);

SF=reshape(sol.y(1:N*N,end),N,N);
PF=reshape(sol.y(N*N+(1:N*N),end),N,N);
GF=reshape(sol.y(2*N*N+(1:N*N),end),N,N);

colormap('hot'); 
imagesc(SF)
