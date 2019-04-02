N=100;
u = zeros(N,2);
u(1,:)=[0 0];
for i =2:N

	% first dimension
	if rand(1) > 0.5
		u(i,1) = u(i-1,1)-1;
	else
		u(i,1) = u(i-1,1)+1;
	end

	% second dimension
	if rand(1) > 0.5
		u(i,2) = u(i-1,2)-1;
	else
		u(i,2) = u(i-1,2)+1;
	end
end
