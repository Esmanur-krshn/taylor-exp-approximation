clc; clear; close all; % Komut penceresini temizler, değişkenleri siler ve açık grafikleri kapatır

% Kullanıcıdan x değerini al
x = input('x değerini giriniz : ');

% Kullanıcıdan Taylor serisinde kullanılacak terim sayısını al
n = input('Terim sayısını giriniz : ');

% Taylor serisinin toplam sonucunu tutacak değişken
taylor_sonuc = 0;

% Faktoriyel hesaplamak için başlangıç değeri
faktoriyel = 1;

% Taylor serisini hesaplamak için for döngüsü
for i = 0:n
    
    % Faktoriyel hesaplama (i! değeri)
    if i > 0
        faktoriyel = faktoriyel * i;
    end
    
    % Taylor serisinin i. terimi (x^i / i!)
    terim = (x^i) / faktoriyel;
    
    % Hesaplanan terimi toplam sonuca ekleme
    taylor_sonuc = taylor_sonuc + terim;
    
end

% MATLAB'ın hazır exp(x) fonksiyonu ile gerçek değeri hesaplama
gercek_deger = exp(x);

% Sonuç
disp(["Taylor serisi sonucu : " num2str(taylor_sonuc)]);
disp(["Gerçek exp(x) değeri : " num2str(gercek_deger)]);

% Grafik çizimi için x değerleri oluşturma 

x_degerleri = -4:0.1:4;

% Taylor serisi grafiğini tutacak boş dizi oluşturma
taylor_grafik = zeros(size(x_degerleri));

% Her x değeri için Taylor serisi hesaplama
for k = 1:length(x_degerleri)
    
    % Dizideki x değerini alma
    x = x_degerleri(k);
    
    % Toplam ve faktoriyeli sıfırlama
    toplam = 0;
    faktoriyel = 1;
    
    % Taylor serisini tekrar hesaplama
    for i = 0:n
        
        % Faktoriyel hesaplama
        if i > 0
            faktoriyel = faktoriyel * i;
        end
        
        % Taylor serisi toplamına terim ekleme
        toplam = toplam + (x^i)/faktoriyel;
        
    end
    
    % Hesaplanan değeri grafik dizisine ekleme
    taylor_grafik(k) = toplam;
    
end

% Gerçek e^x değerlerini hesaplama
gercek_grafik = exp(x_degerleri);

% Gerçek e^x grafiğini çizme
plot(x_degerleri , gercek_grafik , "b");

% Aynı grafikte ikinci eğriyi çizmek için hold on
hold on

% Taylor serisi yaklaşım grafiğini çizme
plot(x_degerleri , taylor_grafik , " r");

% Grafik açıklaması (legend)
legend("Gerçek e^x","Taylor serisi yaklaşımı");

% X ekseni etiketi
xlabel("x");

% Y ekseni etiketi
ylabel("f(x)");

% Grafiğe kareli arka plan ekleme
grid on

