function visualize_distance(distance)

x = 1:length(distance)
[val, ind] = sort(distance,'ascend');

figure('Name', 'Visualize distances'); subplot(1,2,1); plot(x, distance);
for i=1:5
    hold on;
    plot(ind(i),val(i),'-o')
end

subplot(1,2,2); plot(x, val); 
for i=1:5
    hold on;
    plot(i,val(i),'-o')
end

end