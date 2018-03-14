%create array setting the number of neuros of each layer including input and output layer. example given below.

numNeurons = [784 2 2 2 2 10];
numHidLayers = length(numNeurons) - 2;
weight{1} = rand(numNeurons(1),numNeurons(2));
weight{2} = rand(numNeurons(2),numNeurons(3));
weight{3} = rand(numNeurons(3),numNeurons(4));
weight{4} = rand(numNeurons(4),numNeurons(5));
weight{5} = rand(numNeurons(5),numNeurons(6));

target = [1 0 0 0 0 0 0 0 0 0];
[m,n] = size(train0);



for i=1:m
    input = double(train0(i,:));
    outs = Network(numNeurons, numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end



target = [0 1 0 0 0 0 0 0 0 0];
[m,n] = size(train1);

for i=1:m
    input = double(train1(i,:));
    outs = Network(numNeurons,numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 1 0 0 0 0 0 0 0];


[m,n] = size(train2);

for i=1:m
    input = double(train2(i,:));
    outs = Network(numNeurons, numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 1 0 0 0 0 0 0];

[m,n] = size(train3);

for i=1:m
    input = double(train3(i,:));
    outs = Network(numNeurons, numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end



target = [0 0 0 0 1 0 0 0 0 0];


[m,n] = size(train4);

for i=1:m
    input = double(train4(i,:));
    outs = Network(numNeurons,numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 0 0 1 0 0 0 0];
[m,n] = size(train5);

for i=1:m
    input = double(train5(i,:));
    outs = Network(numNeurons,numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end

target = [0 0 0 0 0 0 1 0 0 0];

[m,n] = size(train6);

for i=1:m
    input = double(train6(i,:));
    outs = Network(numNeurons,numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 0 0 0 0 1 0 0];

[m,n] = size(train7);

for i=1:m
    input = double(train7(i,:));
    outs = Network(numNeurons,numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end


target = [0 0 0 0 0 0 0 0 1 0];
[m,n] = size(train8);

for i=1:m
    input = double(train8(i,:));
    outs = Network(numNeurons,numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);
end

target = [0 0 0 0 0 0 0 0 0 1];

[m,n] = size(train9);

for i=1:m    
    input = double(train9(i,:));
    outs = Network(numNeurons,numHidLayers,input,weight);
    error = abs(target - outs{length(outs)});
    weight = backwards(outs, weight, error);   
end
