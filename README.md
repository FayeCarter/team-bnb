# Makers BnB: Team BnB

## Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

## User Stories

### User

> As a potential user,  
> so that I can use the service,  
> I want to be able to sign up.

> As a user,  
> so that I can use my account,  
> I want to be able to log in.

> As a user,  
> to prevent anyone messing with my account,  
> I want to be able to log out.

> As a user,
> so that I can see the available properties,
> I want to see a list of properties.

### Landlord

> As a landlord,  
> so that I can rent out many spaces,  
> I can list more than one space.

> As a landlord,  
> so that I can describe my space,  
> when listing a space, it can have a name, description and price per night.

> As a landlord,  
> so that I can rent out my space,  
> I can list a new space.

> As a landlord,  
> so that I can control who rents my space,  
> I can approve a booking.

> As a landlord,  
> So that I can manage my calendar,  
> I want to be able to select dates that the space is available.

> As a landlord,  
> so that I can take my pick of potential tenants,  
> I want all bookings on a waiting list.

> As a landlord,  
> so that I only have one tenant per night,  
> when I approve a booking all other booking requests for that night are cancelled.

### Tenant

> As a tenant,  
> so that I can stay at a space,  
> I want to be able to request to hire a space for one night.

> As a tenant,  
> so that I  do not cause a double booking,  
> I should only be able to book available dates (landlord specified available and not already booked).

## MVP

> As a user,
> so that I can see the available properties,
> I want to see a list of properties.

> As a landlord,  
> so that I can rent out my space,  
> I can list a new space.

## Instructions

### Database Setup
1. Connect to PSQL - psql postgres
2. Create a database - CREATE DATABASE bnb;
3. Connect to your database - \c bnb;
4. Create table for spaces - follow migrations for db/migrations/01_create_spaces_table.sql
5. Follow steps 2-4 to create a second database called 'bnb_test'
