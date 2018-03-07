function neuron = neuron(input, weight)

Net = input * weight';

neuron = logsig(Net);

end