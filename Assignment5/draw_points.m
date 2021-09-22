function draw_points(x)

hold on; plot(x(:,1), x(:,2), "rx", 'LineWidth', 2);
for i = 1 : size(x,1) 
   text(x(i,1), x(i,2), num2str(i)) ;
end
hold off;
end