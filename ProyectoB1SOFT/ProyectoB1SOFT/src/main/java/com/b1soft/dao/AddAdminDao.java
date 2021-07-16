/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.dao;

import com.b1soft.modelo.AddAdmin;
import java.util.List;

/**
 *
 * @author na_gr
 */
public interface AddAdminDao {
    
    public AddAdmin create(final AddAdmin eAdmin);
    public AddAdmin loginAdmin(final AddAdmin eAddAdmin);
    public AddAdmin findByEmail(final String email);
}
