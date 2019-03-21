N=100;
u = zeros(N,1);
u(1)=0;
for i =2:N
	if rand(1) > 0.5
		u(i) = u(i-1)-1;
	else
		u(i) = u(i-1)+1;
	end
end
