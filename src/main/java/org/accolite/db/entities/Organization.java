package org.accolite.db.entities;

import jakarta.persistence.*;
import lombok.Data;


@Entity
@Data
@Table(name="ORGANIZATION")
public class Organization {

    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long id;

    private String orgName;

    private String location;

    private long owner;

    private long parentOrg;

}


