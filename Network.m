function Out = Network(numHidLayers, numNeurons, input, weight)

[m, n] = size(input);
Out = zeros(1,numNeurons);

%First hidden layer of the network
for i = 1:numNeurons
    net = 0;
    for j = 1:n
        net = net + input(j) * weight(j)';
    end
    Out(i) = logsig(net);
end

for i = 1:(numHidLayers - 1)
    for j = 1:numNeurons
        net = 0;
        for k = 1:numNeurons
            net = net + Out(k) * weight(k)';
        end
        Out(j) = logsig(net);
    end
end

