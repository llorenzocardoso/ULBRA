import numpy as np
import matplotlib.pyplot as plt 
from keras.models import Sequential
from keras.layers import Dense
from keras.optimizers import Adam

# definindo os dados de entrada e saída para o treinamento do modelo
celsius = np.array([-40, -10,  0,  8, 15, 22,  38], dtype=float)
fahrenheit = np.array([-40,  14, 32, 46.4, 59, 71.6, 100], dtype=float)

# definindo a camada de neurônios
l1 = Dense(units=2, input_shape=[1])

# criando o modelo, nesse caso sequencial, que recebe a camada definida anteriormente
model = Sequential([l1])

# compilando o modelo com uma função de perda (loss) e um otimizador
model.compile(loss='mean_squared_error', optimizer=Adam(0.1))

# treinando o modelo com os dados de entrada e saída. 
history = model.fit(celsius, fahrenheit, epochs=1000, verbose=True)
print("Finished training the model")

# plotando o histórico da função de perda (loss) ao longo das épocas de treinamento
plt.plot(history.history['loss'])
plt.xlabel('Epoch Number')
plt.ylabel("Loss Magnitude")
plt.show()

# realizando uma previsão usando o modelo treinado
print(model.predict([100]))

# exibindo os parâmetros (pesos e vieses) da camada l1
print("These are the layer variables: {}".format(l1.get_weights()))