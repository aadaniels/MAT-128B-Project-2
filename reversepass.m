function weight = backwards(outs, weight, error)
delta = (outs{length(outs)}.*(1-outs{length(outs)})).*error;

change{length(weight)} = 0.01*outs{length(outs)-1}'*delta;


for i=length(weight):-1:2
    delta = (delta*weight{i}').*(outs{i}.*(1-outs{i}));
    change{i-1} = 0.01.*outs{i-1}'*delta;
end

for i=1:length(weight)
    weight{i} = weight{i} + change{i};
end

end
