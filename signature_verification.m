A = imread('C:\Users\prajw\OneDrive\Desktop\s1.jpg');
B = imread('C:\Users\prajw\OneDrive\Desktop\ps1.jpg'); 

I1=rgb2gray(A);
subplot(2,1,1)
imshow(I1)
figure;
I2=rgb2gray(B);
subplot(2,1,2);
imshow(I2)

figure;
points1 = detectHarrisFeatures(I1); plot(points1);
figure;
points2 = detectHarrisFeatures(I2); plot(points2);

[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);

indexPairs = matchFeatures(features1,features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

figure;
showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');

u=matchedPoints2.Metric-matchedPoints1.Metric;

if abs(u)<=0.03 
    disp("Matched");
else
    disp("Not Matched");
end