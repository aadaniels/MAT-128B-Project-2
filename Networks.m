numNeurons = [784 3 3 10];
numHidLayers = 2;
weight{1} = rand(numNeurons(1),numNeurons(2));
weight{2} = rand(numNeurons(2),numNeurons(3));
weight{3} = rand(numNeurons(3),numNeurons(4));

input = double(train1(1,:));

target = [0 1 0 0 0 0 0 0 0 0];

outs = Network(numHidLayers,input,weight);
error = abs(target - outs{length(numNeurons)});
weight = backwards(outs, weight, error, numNeurons);




function outs = Network(numHidLayers,input,weight)
outs{1} = input;
net = input * weight{1};
outs{2} = logsig(net);

for i = 1:(numHidLayers - 1)
    net = outs{i+1}*weight{i+1};
    outs{i+2} = logsig(net);
end


net = outs{length(weight)}*weight{length(weight)};
outs{numHidLayers+2} = logsig(net);
end

function weight = backwards(outs, weight, error, numNeurons)
for i=1:numNeurons(length(numNeurons))
    delta{length(weight)}(i) = outs{length(outs)}(i) * (1-outs{length(outs)}(i)) * error(i);
end
    
for i=1:length(outs{length(outs)-1})
    for j=1:length(outs{length(outs)})
        change{length(weight)}(i,j) = 0.1 * delta{length(weight)}(j) * outs{length(outs)-1}(i);
    end
end

for i=length(weight):-1:2
    delta{i-1} = (delta{i}*weight{i}').*(outs{i}.*(1-outs{i}));
    for j=1:length(outs{i-1})
        for k=1:length(outs{i})
            change{i-1}(j,k) = 0.1 * delta{i-1}(k) * outs{i-1}(j);
        end
    end
end

for i=1:length(weight)
    weight{i} = weight{i} + change{i};
end
end


function neuron = logsig(net)

neuron = (1 + exp(-1 * net)).^-1;

end
