package br.com.casadocodigo.loja.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {


	@RequestMapping(value = "/login", name = "actionLogin")
	public String login(){
		return "auth/login";
	}


	@RequestMapping("/403")
	public String error403(){
		return "errors/403";
	}
}
