clear all
close all
clc

%Loading data
class1 = load('class_1');   % Setosa
class2 = load('class_2');   % Versicolour
class3 = load('class_3');   % Virginica
flowers = [class1; class2; class3];

%Generating appropriate bins for different features
sepal_length_bin = min(flowers(:,1)):0.1:max(flowers(:,1));
sepal_width_bin = min(flowers(:,2)):0.1:max(flowers(:,2));
petal_length_bin = min(flowers(:,3)):0.2:max(flowers(:,3));
petal_width_bin = min(flowers(:,4)):0.1:max(flowers(:,4));

%Sepal length 
figure(1)
sgtitle("Histograms over the different flower features")

subplot(221); hold on;
histogram(class1(:,1),sepal_length_bin)
histogram(class2(:,1),sepal_length_bin)
histogram(class3(:,1),sepal_length_bin)
xlabel("Sepal Length")

%Sepal width
subplot(222); hold on;
histogram(class1(:,2),sepal_width_bin)
histogram(class2(:,2),sepal_width_bin)
histogram(class3(:,2),sepal_width_bin)
xlabel("Sepal Width")

legend("Setosa", "Versicolour", "Virginica")

%Petal length
subplot(223); hold on;
histogram(class1(:,3),petal_length_bin)
histogram(class2(:,3),petal_length_bin)
histogram(class3(:,3),petal_length_bin)
xlabel("Petal Length")

%Petal width
subplot(224); hold on;
histogram(class1(:,4),petal_width_bin)
histogram(class2(:,4),petal_width_bin)
histogram(class3(:,4),petal_width_bin)
xlabel("Petal Width")
