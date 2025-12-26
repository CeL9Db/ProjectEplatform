package com.lanzzStore.interfaces;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lanzzStore.model.Client;

public interface ClientInterface extends JpaRepository<Client, Integer>
{
	Optional<Client> findByEmail(String email);
}