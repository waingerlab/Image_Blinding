%%Drosophila barplots

file = 'randomization_key.xlsx';
sheet = 'organized';

%ap2 subunits Tau
males =xlsread(file,sheet,'t3:x30') %ap2 subunits Tau
females = xlsread(file,sheet,'af3:aj32') %ap2 subunits Tau

%LC3 vs CLTC Tau
males =xlsread(file,sheet,'ag3:ai30') %ap2 subunits Tau
females = xlsread(file,sheet,'au3:aw28') %ap2 subunits Tau

%ap2 subunits GMR
males = xlsread(file,sheet,'e3:i30') %ap2 subunits GMR
females = xlsread(file,sheet,'p3:t30') %ap2 subunits GMR

%LC3 vs CLTC GMR
males = xlsread(file,sheet,'k3:m30') %ap2 subunits GMR
females = xlsread(file,sheet,'v3:x30') %ap2 subunits GMR


%preallocate groups - columns = score from 0-4, rows = genotype
group = males;
group = females
eyegroups = 5;

categories = zeros(numel(group(1,:)),eyegroups);

for n=1: numel(group(1,:))
    tempdata = group(:,n);
    tempdata(isnan(tempdata))=[]; %delete NaNs
    totalanimals = numel(tempdata);
    for nn=0:eyegroups-1 %assuming eyegroups starts with 0
        categories(n,nn+1) = sum(tempdata==nn)/totalanimals;
    end
end


baroutput = bar(categories,'stacked')
baroutput(1).FaceColor = [1 .2 .2]
baroutput(2).FaceColor = [.8 .5 .5]
baroutput(3).FaceColor = [.5 .2 .2]
baroutput(4).FaceColor = [.3 .1 .1]
baroutput(5).FaceColor = [0 0 0]

%% STING plot for Christine

file = 'Autophagy_Endocytosis_screen_240322.xlsx';
sheet = 'Screen Results';

control = xlsread(file,sheet,'j3:k21');
control = control(:);
nrv1 = xlsread(file,sheet,'aq3:aq22');

group = nan(38,2);
group(:,1)=control;
group(1:20,2)=nrv1;

eyegroups = 5;

categories = zeros(numel(group(1,:)),eyegroups);

for n=1: numel(group(1,:))
    tempdata = group(:,n);
    tempdata(isnan(tempdata))=[]; %delete NaNs
    totalanimals = numel(tempdata);
    for nn=0:eyegroups-1 %assuming eyegroups starts with 0
        categories(n,nn+1) = sum(tempdata==nn)/totalanimals;
    end
end


baroutput = bar(categories,'stacked')
baroutput(1).FaceColor = [1 .2 .2]
baroutput(2).FaceColor = [.8 .5 .5]
baroutput(3).FaceColor = [.5 .2 .2]
baroutput(4).FaceColor = [.3 .1 .1]
baroutput(5).FaceColor = [0 0 0]

