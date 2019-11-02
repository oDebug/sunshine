package merrymac.sunshinecontacts.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.util.StringUtils;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
public class DatabaseConfig {
    @Value("${spring.datasource.url}")
    private String url;

    @Value("${spring.datasource.driver-class-name}")
    private String driverName;

    @Value("${spring.datasource.hikari.connection-timeout}")
    private Long connectionTimeout;

    @Value("${spring.datasource.hikari.maximum-pool-size}")
    private int maxPoolSize;

    @Value("${spring.datasource.username}")
    private String username;

    @Value("${spring.datasource.password}")
    private String password;

    @Bean
    protected DataSource dataSource() {
        HikariConfig poolProperties = new HikariConfig();
        if (StringUtils.isEmpty(url)) {
            return null;
        }
        Properties properties = new Properties();
        poolProperties.setUsername(username);
        poolProperties.setPassword(password);
        poolProperties.setJdbcUrl(url);
        poolProperties.setDriverClassName(driverName);
        poolProperties.setConnectionTimeout(connectionTimeout);
        poolProperties.setMaximumPoolSize(maxPoolSize);

        return new HikariDataSource(poolProperties);
    }
}
