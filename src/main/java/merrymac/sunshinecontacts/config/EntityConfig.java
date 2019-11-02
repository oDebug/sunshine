package merrymac.sunshinecontacts.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EntityScan(basePackages = "merrymac.sunshinecontacts.dao.entity")
@EnableJpaRepositories(basePackages = {"merrymac.sunshinecontacts.dao.repository"})
public class EntityConfig {
}
