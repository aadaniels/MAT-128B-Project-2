numNeurons = [784 3 10];
numHidLayers = 1;
weight{1} = 10^-4*rand(numNeurons(1),numNeurons(2));
weight{2} = 10^-4*rand(numNeurons(2),numNeurons(3));

target = [1 0 0 0 0 0 0 0 0 0];
[m,n] = size(train0);


for i=1:m
    input = double(train0(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 1 0 0 0 0 0 0 0 0];
[m,n] = size(train1);

for i=1:m
    input = double(train1(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 1 0 0 0 0 0 0 0];


[m,n] = size(train2);

for i=1:m
    input = double(train2(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 1 0 0 0 0 0 0];

[m,n] = size(train3);

for i=1:m
    input = double(train3(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end



target = [0 0 0 0 1 0 0 0 0 0];


[m,n] = size(train4);

for i=1:m
    input = double(train4(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 0 0 1 0 0 0 0];
[m,n] = size(train5);

for i=1:m
    input = double(train5(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 0 0 0 1 0 0 0];

[m,n] = size(train6);

for i=1:m
    input = double(train6(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 0 0 0 0 1 0 0];

[m,n] = size(train7);

for i=1:m
    input = double(train7(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 0 0 0 0 0 1 0];
[m,n] = size(train8);

for i=1:m
    input = double(train8(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end

target = [0 0 0 0 0 0 0 0 0 1];

[m,n] = size(train9);

for i=1:m    
    input = double(train9(i,:));
    outs = Network(numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);   
end

input = double(test1(1,:));
outs = Network(numHidLayers,input,weight);


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

function weight = backwards(outs, weight, error)
delta{length(weight)} = outs{length(outs)}.*(1-outs{length(outs)}).*error;

change{length(weight)} = 0.1.* outs{length(outs)-1}'*delta{length(weight)} ;


for i=length(weight):-1:2
    delta{i-1} = delta{i}*weight{i}'.*(outs{i}.*(1-outs{i}));
    change{i-1} = 0.1.*outs{i-1}'*delta{i-1};
end

for i=1:length(weight)
    weight{i} = weight{i} + change{i};
end

end


function neuron = logsig(net)

neuron = (1 + exp(-1 * net)).^-1;

end

function data = normal(data)
for i=1:length(data)
    if data(i) > 0
        data(i) = 1;
    else
        data(i) = 0;
    end
end
end