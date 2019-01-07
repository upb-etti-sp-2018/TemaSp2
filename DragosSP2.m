clear all
clc
T=40;
f=1/T;
w=2*pi*f;
step=T/1000;
t = 0:step:2*T;
figure(4);
s=(1+square(w*t,7.5))/2;
plot(t,s,'k'), grid;
axis([0 80 -1 2])
xlabel('Timp[s]');
ylabel('Amplitudine');
title('Semnal dreptunghiular');
N=50;
C = zeros(1,2*N+1);
    for n = -N:N
    C(n+N+1) = 1/T * integral(@(t)((1+square(w*t,7.5))/2).*exp(-1j*n*w*t),0,T) ;
    end
sr = 0;
        for n = -N:N
            sr = sr + C(n+N+1)*exp(1j*n*w*t) ;
        end
    figure(1);
hold on
plot(t,real(sr),'-.r',t,imag(sr),'-.r');
plot(t,s);
xlabel('Timp(s)');
ylabel('Semnalul(t) si semnalul reconstruit(t)');
title('Semnalul initial si cel reconstruit')
hold off
     figure(2);
hold on
stem((-N:N)*w,2*abs(C));
xlabel('Pulsatia w');
ylabel('Amplitudinile Ak');
title('Spectrul de Amplitudini');
hold off

%Am studiat la cursul de SS teoria seriilor Fourier(complexa ,trigonometrica si armonica) unde am aflat
%ca orice semnal periodic se poate aproxima printr-o suma infinita de cosinusuri si sinusuri de frecvente diferite,
%fiecare fiind ponderat cu nu anumit coeficient.
%Coeficientii reprezinta in esenta spectrul(amplitudinea pentru anumite frecvente).
%Reconstruirea semnalului se face folosind un numar finit de termeni si apropie destul de mult de forma
%semanlului original , insa are o marja de eroare.Cu cat numarul de coeficienti ai Serieri Fourier ,marja
%de eroare se diminueaza.Se observa ca semnalul poate fi aproximat cu usurinta printr-o suma de sinusoide,
%semnalul avang cariatii ce prezinta caracter sinusoidal.