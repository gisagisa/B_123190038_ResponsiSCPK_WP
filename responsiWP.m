x=readtable('Real estate valuation data set.xlsx');%membaca data
data=x;

dataset = [data(1:50,3) data(1:50,4) data(1:50,5) data(1:50,8)];%memilih data yang digunakan
datarumah= table2array(dataset);%konversi dari bentuk tabel ke array

k = [0,0,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan  0= atribut biaya
w = [3,5,4,1];%bobot 

%tahapan pertama, perbaikan bobot

[m n]=size(datarumah);%menghitung ukuran matrix y
w=w./sum(w); %normalisasi bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);%cost
    end;
end;
for i=1:m,
    S(i)=prod(datarumah(i,:).^w);%benefit
end;

%tahapan ketiga, proses perangkingan
V= S/sum(S); %menghitung v dengan menormalisasi s

result=max(V); %mencari nilai max dari v sebagai alternatif terbaik
alternatif=find(V == result); %mencari index dari hasil v
disp ("Alternatif terbaik adalah alternatif "+ alternatif); %menampilkan alternatif terbaik
