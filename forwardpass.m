function outs = Network(numNeurons,numHidLayers,input,weight)
outs = cell(1,length(numNeurons));
outs{1} = input;
net = input * weight{1};
outs{2} = logsig(net);

for i = 1:(numHidLayers - 1)
    net = outs{i+1}*weight{i+1};
    outs{i+2} = logsig(net);
end


net = outs{length(weight)}*weight{length(weight)};
outs{length(numNeurons)} = logsig(net);
end
