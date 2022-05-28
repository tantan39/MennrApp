//
//  SystemInfo.m
//  mennrapp
//
//  Created by Tan Tan on 5/28/22.
//

#import <Foundation/Foundation.h>
#import <mach/mach.h>
#import <mach/mach_host.h>

static void print_free_memory ()
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;

    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);

    vm_statistics_data_t vm_stat;

    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
    }

    /* Stats in bytes */
    natural_t mem_used = (vm_stat.active_count +
                          vm_stat.inactive_count +
                          vm_stat.wire_count) * pagesize;
    natural_t mem_free = vm_stat.free_count * pagesize;
    natural_t mem_total = mem_used + mem_free;
    NSLog(@"used: %u free: %u total: %u", mem_used, mem_free, mem_total);
}

static natural_t get_memory_used (void)
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;

    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);

    vm_statistics_data_t vm_stat;

    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
    }

    /* Stats in bytes */
    natural_t mem_used = (vm_stat.active_count +
                          vm_stat.inactive_count +
                          vm_stat.wire_count) * pagesize;
//    natural_t mem_free = vm_stat.free_count * pagesize;
//    natural_t mem_total = mem_used + mem_free;
//    NSLog(@"used: %u free: %u total: %u", mem_used, mem_free, mem_total);
    return mem_used;
}

static natural_t get_memory_free (void)
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;

    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);

    vm_statistics_data_t vm_stat;

    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
    }

    /* Stats in bytes */
//    natural_t mem_used = (vm_stat.active_count +
//                          vm_stat.inactive_count +
//                          vm_stat.wire_count) * pagesize;
    natural_t mem_free = vm_stat.free_count * pagesize;
//    natural_t mem_total = mem_used + mem_free;
//    NSLog(@"used: %u free: %u total: %u", mem_used, mem_free, mem_total);
    return mem_free;
}

static natural_t get_memory_total (void)
{
    natural_t mem_total = get_memory_used() + get_memory_free();
    return mem_total;
}
