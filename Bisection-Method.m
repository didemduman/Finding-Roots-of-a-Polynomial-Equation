clc;
clear;
clear all;

aa=input('Enter aa=') %Minimum value of the closed interval
ab=input('Enter ab=') %Maximum value of the closed interval
e=10^-4; %Initialize tolerance value
k=1; %Iteration Index
ak=aa+(ab-aa)/2; %Rule
fak=F1(ak);




while aa>=ab
    disp('Enter different value to aa and ab which aa<ab')
    aa=input('Enter aa again=');
    ab=input('Enter ab again=');
end



while F1(ak)~=0
    k=k+1;
    kn=1:k;
    ak=aa+(ab-aa)/2;
    fak=F1(ak);
    x=linspace(aa,ab,100);
    y1=(x-1).^2.*(x-2).*(x-3);
    y2=4.*x.^3-21.*x.^2+34.*x-17; %Derivative of the function       
    z(k)=ak;
    p=ak;
    if F2(ak)==0
        disp('Iteration terminated due to convergence')
        break
    elseif (ab-aa)<e
        disp('Iteration terminated due to tolerance value (e)')
        break
    elseif F2(ak)*F2(aa)>0
        aa=ak;
    else
        ab=ak;      
    end
    
    figure(1);plot(x,y1,'k')
    hold on 
    figure(1);plot(x,y2,'r')
    title('The Graph of the Function and Its Derivative Versus ak')
    xlabel('x')
    ylabel('Function and Its Derivative')
    legend('Function','Derivative of function')
    
    figure(2)
    subplot(3,1,1)
    line([k-1,k],[F1(ak-1) F1(ak)])
    title('f(ak)')
    subplot(3,1,2)
    line([k-1 k],[F1(k-1) F1(k)])
    title('\delta f(k)')
    subplot(3,1,3)
    line([k-1 k],[ak-1 ak])
    title('ak')
    
    figure(3)
    figure(3);plot(x,y1,'k')
    hold on 
    figure(3);plot(x,y2,'r')
    figure(3);plot(z(k),F1(p),'bo');
    title('The Graph of the Function and Its Derivative Versus ak')
    xlabel('x')
    ylabel('Function and Its Derivative')
    legend('Function','Derivative of function')
    
end
   
fprintf('Root of equation is %f',p)

        
        