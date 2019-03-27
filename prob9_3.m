x=zeros(300,1);
for i =1:300
	global T;
	T=i*0.01;
	function y = fun(F)
		global T;
		y=F - exp(-T*(1+0.01 - F));
	end
	x(i)=fsolve(@fun,0);
end

