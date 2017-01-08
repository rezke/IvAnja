
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/07/2017 19:16:55
-- Generated from EDMX file: C:\Users\David\documents\visual studio 2015\Projects\IvAnja\DAL\IvAnja.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [IvAnja];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_IngredientIngredientProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[IngredientProducts] DROP CONSTRAINT [FK_IngredientIngredientProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_IngredientProductProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[IngredientProducts] DROP CONSTRAINT [FK_IngredientProductProduct];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Ingredients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ingredients];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[IngredientProducts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IngredientProducts];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Ingredients'
CREATE TABLE [dbo].[Ingredients] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'IngredientProducts'
CREATE TABLE [dbo].[IngredientProducts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IngredientId] int  NOT NULL,
    [Quantity] int  NOT NULL,
    [Product_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Ingredients'
ALTER TABLE [dbo].[Ingredients]
ADD CONSTRAINT [PK_Ingredients]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'IngredientProducts'
ALTER TABLE [dbo].[IngredientProducts]
ADD CONSTRAINT [PK_IngredientProducts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IngredientId] in table 'IngredientProducts'
ALTER TABLE [dbo].[IngredientProducts]
ADD CONSTRAINT [FK_IngredientIngredientProduct]
    FOREIGN KEY ([IngredientId])
    REFERENCES [dbo].[Ingredients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IngredientIngredientProduct'
CREATE INDEX [IX_FK_IngredientIngredientProduct]
ON [dbo].[IngredientProducts]
    ([IngredientId]);
GO

-- Creating foreign key on [Product_Id] in table 'IngredientProducts'
ALTER TABLE [dbo].[IngredientProducts]
ADD CONSTRAINT [FK_IngredientProductProduct]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IngredientProductProduct'
CREATE INDEX [IX_FK_IngredientProductProduct]
ON [dbo].[IngredientProducts]
    ([Product_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------