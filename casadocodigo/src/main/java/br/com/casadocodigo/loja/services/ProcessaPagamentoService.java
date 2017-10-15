package br.com.casadocodigo.loja.services;

import br.com.casadocodigo.loja.models.PaymentData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Service
public class ProcessaPagamentoService {

	@Autowired
	private RestTemplate restTemplate;


	public <T> T processar(PaymentData paymentData, PagamentoResult<T> onSuccess, PagamentoResult<T> onError){
		try{
			String uriToPay = "http://book-payment.herokuapp.com/payment";
			String result = restTemplate.postForObject(uriToPay, paymentData, String.class);
			System.out.println(result);
			return onSuccess.result(result);
		}catch (HttpClientErrorException e){
			System.out.println("Ocorreu um erro ao criar o Pagamento "+ e.getMessage());
			return onError.result(e.getMessage());
		}
	}

	public interface PagamentoResult<T> {
		T result(String value);
	}

}
