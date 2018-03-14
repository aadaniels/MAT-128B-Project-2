numNeurons = [784 2 2 2 2 10];
numHidLayers = length(numNeurons) - 2;
weight{1} = rand(numNeurons(1),numNeurons(2));
weight{2} = rand(numNeurons(2),numNeurons(3));
weight{3} = rand(numNeurons(3),numNeurons(4));
weight{4} = rand(numNeurons(4),numNeurons(5));
weight{5} = rand(numNeurons(5),numNeurons(6));
