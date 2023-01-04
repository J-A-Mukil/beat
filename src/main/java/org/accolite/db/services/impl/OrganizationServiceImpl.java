package org.accolite.db.services.impl;

import lombok.extern.slf4j.Slf4j;
import org.accolite.db.entities.Organization;
import org.accolite.db.repo.OrganizationRepository;
import org.accolite.db.services.OrganizationService;
import org.accolite.pojo.OrganizationCard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    private OrganizationRepository organizationRepository;

    @Override
    public Organization createOrganization(Organization organization) {
        return organizationRepository.save(organization);
    }

    @Override
    public Optional<Organization> getOrganizationById(long id) {
        Optional<Organization> organizationFromDbObj = this.organizationRepository.findById(id);
        return organizationFromDbObj;
    }

    @Override
    public List<Organization> getOrganizationsByName(String name) {
        List<Organization> organizationList = organizationRepository.findAllByOrgName(name);
        return organizationList;
    }

    @Override
    public List<Organization> getOrganization() { return this.organizationRepository.findAll(); }

    @Override
    public boolean disableOrganization(Organization organization) {
        Optional<Organization> orgObj = this.organizationRepository.findById(organization.getId());
        if (orgObj.isPresent()) {
            Organization organizationUpdate = orgObj.get();
            organizationUpdate.setStatus(false);

            organizationRepository.save(organizationUpdate);
            return true;
        }
        else {
            log.info("Employee with employee ID: " + organization.getId() + "is not present");
            return false;
        }
    }

    @Override
    public boolean saveUpdateOrganization(Organization organization) {
        Optional<Organization> organizationFromDbObj = organizationRepository.findById(organization.getId());
        if (organizationFromDbObj.isPresent()) {
            Organization previousOrganizationRecord = organizationFromDbObj.get();
            previousOrganizationRecord = organization;
            organizationRepository.save(previousOrganizationRecord);
            return true;
        }
        else {
            return false;
        }
    }

    @Override
    public Organization cloneDetails(Organization organizationUpdate, Organization organization) {

        organizationUpdate.setId(organization.getId());
        organizationUpdate.setOrgName(organization.getOrgName());
        organizationUpdate.setLocation(organization.getLocation());
        organizationUpdate.setOwner(organization.getOwner());
        organizationUpdate.setOwnerEmpId(organization.getOwnerEmpId());
        organizationUpdate.setParentOrg(organization.getParentOrg());
        organizationUpdate.setStatus(organization.isStatus());
        return organizationUpdate;
    }

    @Override
    public String getOrganizationName (long organizationId) {
        Optional<Organization> organizationFromDbObj = organizationRepository.findById(organizationId);
        if (organizationFromDbObj.isPresent()) {
            Organization organizationFromDb = organizationFromDbObj.get();
            return organizationFromDb.getOrgName();
        }
        else {
            log.info("This employee is not related to any organization");
            return null;
        }
    }

    @Override
    public OrganizationCard getParentCard(long parentOrg) {
        Organization parent = new Organization();
        List<Organization> orgList = getOrganization();
        for (int i = 0; i < orgList.size(); i++) {
            if (orgList.get(i).getId() == parentOrg) {
                parent = orgList.get(i);
                break;
            }
        }
        OrganizationCard parentCard = new OrganizationCard();
        parentCard.setId(parent.getId());
        parentCard.setOrgName(parent.getOrgName());
        parentCard.setLocation(parent.getLocation());
        parentCard.setOwner(parent.getOwner());
        return parentCard;
    }

    @Override
    public OrganizationCard cloneToOrganizationCard(OrganizationCard curOrganizationCard, Organization curOrganization) {
        curOrganizationCard.setId(curOrganization.getId());
        curOrganizationCard.setOrgName(curOrganization.getOrgName());
        curOrganizationCard.setLocation(curOrganization.getLocation());
        curOrganizationCard.setOwner(curOrganization.getOwner());
        return curOrganizationCard;
    }
}