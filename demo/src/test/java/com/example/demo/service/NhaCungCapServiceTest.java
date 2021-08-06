package com.example.demo.service;

import com.example.demo.controller.NhaCungCapController;
import com.example.demo.model.NhaCungCap;
import com.example.demo.repo.NhaCungCapRepo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class NhaCungCapServiceTest {

    @InjectMocks
    NhaCungCapController nhaCungCapController;

    @Mock
    NhaCungCapRepo nhaCungCapRepo;

    @Test
    public void getAllNhaCungCap(){
        List<NhaCungCap> nhaCungCapList = new ArrayList<>();
        NhaCungCap nhaCungCap = new NhaCungCap();
        nhaCungCap.setTenNhaCungCap("ten test");
        nhaCungCap.setSoDienThoai("0987654321");
        nhaCungCap.setFax("fax@test");
        nhaCungCap.setEmail("mail@gmail.com");

        nhaCungCapList.add(nhaCungCap);
        when(nhaCungCapRepo.findAll()).thenReturn(nhaCungCapList);
        assertEquals(1,nhaCungCapList.size());
        assertEquals(nhaCungCapController.getListNhaCungCap(),nhaCungCapList);
    }
}
