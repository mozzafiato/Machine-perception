function d = hellinger(D1, D2)

d = sqrt(0.5*sum((sqrt(D1)-sqrt(D2)).^2));

end