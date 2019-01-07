%Numar de ordine: 14

P = 40; %Perioada

D = 14; 

N = 50; %Numar de coeficienti 

w0 = 2*pi/P; 

t_tr = 0:0.02:D; %esantionarea semnalului original

x_tr = sawtooth((pi/12)*t_tr,0.5)/2+0.5; %Semnalul triunghiular

t_mod = 0:0.02:P; %esantionarea semnalului modificat

x_mod = zeros(1,length(t_mod)); %initializare a semnalului modificat cu valori nule

x_mod(t<=D) = x_tr; %modificam valorile nule cu valori din semnalul original

                %unde avem valori din t <= durata semnalului 

subplot(2,1,1)

plot(t,x_mod),title('x(t)(linie solida) si semnalul reconstruit(linie punctata)'); %afisare x(t)

hold on;





for k = -N:N %k este variabila dupa care se realizeaza suma

    x_t = x_tr; %x_t e semnalul realizat dupa formula SF data

    x_t = x_t .* exp(-1i*k*w0*t_tr); %inmultire intre doua matrice element cu element

    X(k+N+1) = 0; %initializare cu valoare nula

    for i = 1:length(t_tr)-1

        X(k+N+1) = X(k+N+1) + (t_tr(i+1)-t_tr(i)) * (x_t(i)+x_t(i+1))/2; %reconstructia folosind coeficientii

    end

end



for i = 1:length(t_mod) %i este variabila dupa care se realizeaza suma

    x_finit(i) = 0; %initializare cu valoare nula

    for k=-N:N

        x_finit(i) = x_finit(i) + (1/P) * X(k+51) * exp(1i*k*w0*t_mod(i));  %reconstructia folosind coeficientii

    end

end

plot(t,x_finit,'--'); %afisare reconstructie semnal folosind cei N coeficienti



subplot(2,1,2)

w=-50*w0:w0:50*w0; %w este vectorul ce ne va permite afisarea spectrului functiei

stem(w/(2*pi),abs(X)),title('Spectrul lui x(t)'); %afisarea spectrului



%Teoria seriilor Fourier (SFT, SFA si SFC) ne spune

%ca orice semnal periodic poate fi aproximat printr-o suma infinita de sinusuri

%si cosinusuri de diferite frecvente, fiecare ponderat cu un anumit coeficient. 

%Acesti coeficienti reprezinta practic spectrul 

%Semnalul reconstruit foloseste 50 de termeni si are aceeasi forma ca

%semnalul original, cu mici diferente de rigoare. Cu cat marim

%numarul de coeficienti ai SF, aceasta diferenta va fi din ce in ce mai

%mica. In plus se observa faptul ca semnalul poate fi aproximat printr-o

%suma de sin, variatiile semnalului prezentand un caracter sinusoidal.