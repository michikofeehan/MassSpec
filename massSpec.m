%MassSpec
%93.71mM
%First hour has extreme spike in serum levels so that has been excluded in
%plot

TP=[6,24,48,72];

% Serum Level ng/mL values
a =[70.71,121.30,60.50,48.52]; %85*
b = [88.22,61.70,40.45,61.99]; %85*
c = [82.17,47.70,36.56,40.69]; %85*
d = [86.14,58.08,32.43,43.25]; %85* 

plot(TP, a,'mo-',TP,b,'g*-',TP,c,'bo-',TP,d,'k*-'); 
xlabel('Time Point (Hours)');
ylabel('Serum Level  ng/mL');
title('850-853  93.71mM serum levels ');
legend('850','851','852','853');
txt = '\leftarrow max serum level 121.30 ng/mL';
text(24,121.30,txt)
txt = '\leftarrow min serum level 32.43 ng/mL';
text(48,32.43,txt)
